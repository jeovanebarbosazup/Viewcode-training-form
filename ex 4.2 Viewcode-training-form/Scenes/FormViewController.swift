//
//  ViewController.swift
//  ex 4.2 Viewcode-training-form
//
//  Created by jeovane.barbosa on 26/12/22.
//

import UIKit

//MARK: - Implements Layout
class FormViewController: UIViewController {
    
    lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 32
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        return stackView
    }()
    
    lazy var headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 32
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(avatarImageView)
        
        return stackView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Casa do Código"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .orange
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "avatar")
        
        return imageView
    }()
    
    lazy var bodyStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.addArrangedSubview(fotoStackView)
        stackView.addArrangedSubview(nomeStackView)
        stackView.addArrangedSubview(bioStackView)
        stackView.addArrangedSubview(tecnologiasStackView)
        
        return stackView
    }()
    
    lazy var fotoStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.spacing = 8
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.addArrangedSubview(fotoLabel)
        stackview.addArrangedSubview(fotoTextField)
        
        return stackview
    }()
    
    lazy var fotoLabel: UILabel = {
        let label = UILabel()
        label.text = "Foto:"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var fotoTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "https://domain/pic.png"
        textField.textColor = .secondaryLabel
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        
        return textField
    }()
    
    lazy var nomeStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.spacing = 8
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.addArrangedSubview(nomeLabel)
        stackview.addArrangedSubview(nomeTextField)
        
        return stackview
    }()
    
    lazy var nomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Nome:"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var nomeTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Autor do Livro"
        textField.textColor = .secondaryLabel
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        
        return textField
    }()
    
    lazy var bioStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.spacing = 8
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.addArrangedSubview(bioLabel)
        stackview.addArrangedSubview(bioTextField)
        
        return stackview
    }()
    
    lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.text = "Bio:"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var bioTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Descrição do autor em poucas palavras"
        textField.textColor = .secondaryLabel
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        
        return textField
    }()
    
    lazy var tecnologiasStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.spacing = 8
        stackview.axis = .vertical
        stackview.distribution = .fill
        stackview.addArrangedSubview(tecnologiasLabel)
        stackview.addArrangedSubview(tecnologiasTextField)
        
        return stackview
    }()
    
    lazy var tecnologiasLabel: UILabel = {
        let label = UILabel()
        label.text = "Tecnologias:"
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 14)
        
        return label
    }()
    
    lazy var tecnologiasTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Swift, Desenvolvimento IOS, Java"
        textField.textColor = .secondaryLabel
        textField.borderStyle = .roundedRect
        textField.font = .systemFont(ofSize: 14)
        
        return textField
    }()
    
    lazy var fillingView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    lazy var salvarButton: UIButton = {
        let button = UIButton()
        button.setTitle("Salvar", for: .normal)
        button.setTitleColor(.systemBackground, for: .normal)
        button.backgroundColor = .orange
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(salvarButtonTapped(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    
//MARK: - Implements functionality
    typealias ValidationMessasge = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    @IBAction func salvarButtonTapped(sender: UIButton!) {
        switch isFormValid() {
            
        case (false, let message):
            UIAlertController.showAlert(withTitle: "Error", andMessage: message, fromController: self)
            
        case (true, let message):
            UIAlertController.showAlert(withTitle: "Feito", andMessage: message, fromController: self)
        }
        
    }
    
    private func isFormValid() -> (Bool, ValidationMessasge) {
        if let foto = fotoTextField.text, foto.isEmpty {return (false, "Informe a URL da foto do autor.")}
        if let nome = nomeTextField.text, nome.isEmpty {return (false, "Informe o nome do autor.")}
        if let bio = bioTextField.text, bio.isEmpty {return (false, "Informe a descrição da bio do autor.")}
        if let tecnologias = tecnologiasTextField.text, tecnologias.isEmpty {return (false, "Preencha as tecnologias referentes ao autor")}
        
        return (true, "Autor cadastrado com sucesso!")
    }
    
}

//MARK: - Implements Viewcode protocol
extension FormViewController: Viewcode {
    func buildHierarchies() {
        view.addSubview(containerStackView)
        containerStackView.addArrangedSubview(headerStackView)
        containerStackView.addArrangedSubview(bodyStackView)
        containerStackView.addArrangedSubview(fillingView)
        containerStackView.addArrangedSubview(salvarButton)

        
    }
    
    func setupConstraints() {
        //headerStackView constraints
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        //avatarImageView constraints
        NSLayoutConstraint.activate([
            avatarImageView.heightAnchor.constraint(equalToConstant: 140),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor)
            
        ])
        
        //salvatButton constrainnts
        NSLayoutConstraint.activate([
            salvarButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            salvarButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    func applyAdditionalChanges() {
        view.backgroundColor = .secondarySystemBackground
    }
    
}

