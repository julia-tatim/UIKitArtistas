import UIKit

class ViewController: UIViewController {
    
    // Aqui eu to criando a collection view q vai mostrar as obras
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical // vai rolar pra baixo
        layout.minimumLineSpacing = 16 // espaço entre linhas
        layout.minimumInteritemSpacing = 16 // espaço entre itens
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground // fundo branco ou preto dependendo do tema
        collectionView.alwaysBounceVertical = true // dá aquele efeito de bounce qnd chega no fim
        return collectionView
    }()
    
    // view model com as obras
    private var obraViewModel: ObraViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar() // configura o titulo la em cima
        setupViewModel() // carrega as obras no viewmodel
        setupCollectionView() // configura e mostra a collection
    }
    
    // Titulo da pagina e visual do navigation bar
    private func setupNavigationBar() {
        title = "Galeria de Artistas Curitibanos" // titulo que aparece la em cima
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor: UIColor.label,
            .font: UIFont.systemFont(ofSize: 28, weight: .bold)
        ]
        
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Voltar", // botao de voltar aparece com esse nome
            style: .plain,
            target: nil,
            action: nil
        )
    }
    
    // Aqui eu to adicionando as obras direto na mão (ta hardcoded msm)
    private func setupViewModel() {
        let obras: [ObraDeArte] = [
            ObraDeArte(
                titulo: "Pindorama",
                artista: "Rimon Guimaraes",
                ano: 2020,
                estilo: "Tinta fotocatalítica",
                imagemNome: "pindorama",
                descricao: "Pindorama é uma instalação que explora a relação entre natureza e tecnologia."
            ),
            ObraDeArte(
                titulo: "Jogadores no bar",
                artista: "Poty Lazzarotto",
                ano: 1991,
                estilo: "Gravura",
                imagemNome: "jogadoresnobar",
                descricao: "Uma das obras mais conhecidas de Poty Lazzarotto."
            ),
            ObraDeArte(
                titulo: "Presépio na lata",
                artista: "Helio Leites",
                ano: 2010,
                estilo: "Arte postal",
                imagemNome: "lata",
                descricao: "Obra representativa do movimento de arte postal em Curitiba."
            ),
            ObraDeArte(
                titulo: "O Largo da Ordem",
                artista: "Poty Lazzarotto",
                ano: 1993,
                estilo: "Painel em azulejo",
                imagemNome: "largodaordem",
                descricao: "Mural que retrata cenas históricas do Largo da Ordem, um dos pontos mais tradicionais de Curitiba."
            ),
            ObraDeArte(
                titulo: "Tigre Esmagando a Cobra",
                artista: "João Turin",
                ano: 1944,
                estilo: "Escultura em bronze",
                imagemNome: "tigrecobra",
                descricao: "Escultura que representa a luta entre um tigre e uma cobra, simbolizando força e resistência."
            ),
            ObraDeArte(
                titulo: "Fundação de São Paulo",
                artista: "Maximo Rezler",
                ano: 1949,
                estilo: "Marchetaria",
                imagemNome: "fundacaosaopaulo",
                descricao: "Obra que retrata a fundação da cidade de São Paulo com a técnica de marchetaria."
            ),
            ObraDeArte(
                titulo: "Luar do Sertão",
                artista: "João Turin",
                ano: 1947,
                estilo: "Escultura em bronze",
                imagemNome: "luardosertao",
                descricao: "Escultura que captura a serenidade do sertão sob a luz do luar."
            )
        ]
        obraViewModel = ObraViewModel(obras: obras)
    }

    // configura a collection e posiciona na tela
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        collectionView.register(ObraCell.self, forCellWithReuseIdentifier: "ObraCell") // registra celula custom
        collectionView.dataSource = self // diz q essa classe fornece os dados
        collectionView.delegate = self // diz q essa classe lida com o layout
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // qtd de itens na collection (qtd de obras)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return obraViewModel.numberOfObras()
    }
    
    // cria a celula e preenche com os dados da obra
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ObraCell", for: indexPath) as! ObraCell
        cell.configure(with: obraViewModel.obra(at: indexPath.row))
        return cell
    }
    
    // define tamanho das celulas (dois por linha com espacinho)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.bounds.width - 16
        let widthPerItem = availableWidth / 2 - 8
        return CGSize(width: widthPerItem, height: widthPerItem + 80)
    }
    
    // ação qnd clica numa obra - vai pra tela de detalhe
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let obraSelecionada = obraViewModel.obra(at: indexPath.row)
        let detailVC = DetailViewController(obra: obraSelecionada)
        
        // animaçãozinha qnd toca na celula
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.2, animations: {
                cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }) { _ in
                UIView.animate(withDuration: 0.2) {
                    cell.transform = .identity
                }
                self.navigationController?.pushViewController(detailVC, animated: true)
            }
        } else {
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    // atualiza o layout qnd gira a tela
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}
