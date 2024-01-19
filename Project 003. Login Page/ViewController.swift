//
//  ViewController.swift
//  Project 003. Login Page
//
//  Created by Mac Alexander on 11.01.2024.
//

import UIKit

/* Я переделал название ViewController на First Screen, так как, по сути, у нас будет 1 экран, final class взято из видео для ДЗ, лектор говорил, что это хорошо для оптимизации. Контроллер, как говорили в том же видео, не должен быть загруженным, поэтому я добавил расширения в дополнительный файл с расширениями.*/
class FirstScreen: UIViewController {
    
    // MARK: - UIElements/Oulets
    
    private lazy var imageView: UIImageView = {
        let image = UIImage(named: "backgroundImage")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.textColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var logEntryTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "keanureeves01"
        textfield.textColor = .systemGray
        textfield.backgroundColor = .white
        textfield.textAlignment = .center
        textfield.layer.cornerRadius = 20
        textfield.setLeftIcon(UIImage(named:"icons8-person") ?? UIImage.remove)
        textfield.setRightIcon(UIImage(named:"icons8-done") ?? UIImage.remove)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var passwordEntryTextfield: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.textColor = .systemGray
        textfield.backgroundColor = .white
        textfield.textAlignment = .center
        textfield.layer.cornerRadius = 20
        textfield.setLeftIcon(UIImage(named:"icons8-lock") ?? UIImage.remove)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    private lazy var loginButton: UIButton = {
        let logButton = UIButton(type: .system)
        logButton.clipsToBounds = true
        logButton.backgroundColor = .systemIndigo
        logButton.setTitle("Login", for: .normal)
        logButton.setTitleColor(.white, for: .normal)
        logButton.layer.cornerRadius = 20
        logButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        
        logButton.layer.shadowColor = UIColor.black.cgColor
        logButton.layer.shadowOpacity = 0.3
        logButton.layer.shadowOffset = .zero
        logButton.layer.shadowRadius = 10
        logButton.layer.shouldRasterize = true
        logButton.layer.rasterizationScale = UIScreen.main.scale
        logButton.translatesAutoresizingMaskIntoConstraints = false
        return logButton
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let helpButton = UIButton(type: .system)
        helpButton.clipsToBounds = true
        helpButton.backgroundColor = .none
        helpButton.setTitle("Forgot your password?", for: .normal)
        helpButton.setTitleColor(.white, for: .normal)
        helpButton.layer.cornerRadius = 20
        helpButton.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        helpButton.translatesAutoresizingMaskIntoConstraints = false
        return helpButton
    }()
    
    private lazy var leftMargin: UIView = {
        let offset = UIView()
        offset.backgroundColor = .systemGray
        offset.layer.cornerRadius = 20
        offset.translatesAutoresizingMaskIntoConstraints = false
        return offset
    }()
    
    private lazy var socialMediaConnectionLabel: UILabel = {
        let connectLabel = UILabel()
        connectLabel.text = "or connect with"
        connectLabel.textColor = .systemGray
        connectLabel.font = UIFont.preferredFont(forTextStyle: .body)
        connectLabel.textAlignment = .center
        connectLabel.translatesAutoresizingMaskIntoConstraints = false
        return connectLabel
    }()
    
    private lazy var rightMargin: UIView = {
        let offset = UIView()
        offset.backgroundColor = .systemGray
        offset.layer.cornerRadius = 20
        offset.translatesAutoresizingMaskIntoConstraints = false
        return offset
    }()
    
    private lazy var socialMediaConnectionsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 20
        stack.addArrangedSubview(leftMargin)
        stack.addArrangedSubview(socialMediaConnectionLabel)
        stack.addArrangedSubview(rightMargin)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var facebookLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.backgroundColor = .blue
        button.setTitle("Facebook", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(facebookLoginButtonPressed), for: .touchUpInside)
        button.setImage(UIImage(systemName: "icons8-facebook"), for: .normal)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var twitterLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("Twitter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(twitterLoginButtonPressed), for: .touchUpInside)
        button.setImage(UIImage(systemName: "icons8-twitter"), for: .normal)
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = .zero
        button.layer.shadowRadius = 10
        button.layer.shouldRasterize = true
        button.layer.rasterizationScale = UIScreen.main.scale
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var doNotHaveAccountQuestionLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have account?"
        label.textColor = .systemGray
        label.backgroundColor = .white
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textAlignment = .center
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.clipsToBounds = true
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.systemIndigo, for: .normal)
        button.backgroundColor = .none
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signUpStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.distribution = .fillProportionally
        stack.spacing = 20
        stack.addArrangedSubview(doNotHaveAccountQuestionLabel)
        stack.addArrangedSubview(signUpButton)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        [imageView, logLabel, logEntryTextfield, passwordEntryTextfield, loginButton, forgotPasswordButton, leftMargin, socialMediaConnectionLabel, rightMargin, socialMediaConnectionsStack, facebookLoginButton, twitterLoginButton, doNotHaveAccountQuestionLabel, signUpButton, signUpStack].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            logLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -300)
        ])
        
        NSLayoutConstraint.activate([
            logEntryTextfield.topAnchor.constraint(equalTo: logLabel.bottomAnchor, constant: 40),
            logEntryTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logEntryTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            logEntryTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            logEntryTextfield.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            passwordEntryTextfield.topAnchor.constraint(equalTo: logEntryTextfield.bottomAnchor, constant: 10),
            passwordEntryTextfield.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordEntryTextfield.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            passwordEntryTextfield.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            passwordEntryTextfield.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordEntryTextfield.bottomAnchor, constant: 40),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            loginButton.heightAnchor.constraint(equalToConstant: 45)
        ])
        
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 5),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            leftMargin.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100),
            leftMargin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170),
            leftMargin.heightAnchor.constraint(equalToConstant: 1),
            leftMargin.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            socialMediaConnectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            socialMediaConnectionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170)
        ])
        
        NSLayoutConstraint.activate([
            rightMargin.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 100),
            rightMargin.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170),
            rightMargin.heightAnchor.constraint(equalToConstant: 1),
            rightMargin.widthAnchor.constraint(equalToConstant: 80)
        ])
        
        NSLayoutConstraint.activate([
            socialMediaConnectionsStack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            socialMediaConnectionsStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 170)
        ])
        
        NSLayoutConstraint.activate([
            facebookLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -80),
            facebookLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 210),
            facebookLoginButton.heightAnchor.constraint(equalToConstant: 35),
            facebookLoginButton.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            twitterLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
            twitterLoginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 210),
            twitterLoginButton.heightAnchor.constraint(equalToConstant: 35),
            twitterLoginButton.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            doNotHaveAccountQuestionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -40),
            doNotHaveAccountQuestionLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270),
            doNotHaveAccountQuestionLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 80),
            signUpButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270),
            signUpButton.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        NSLayoutConstraint.activate([
            signUpStack.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            signUpStack.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 270)
        ])
    }
    
    // MARK: - Actions
    
    @objc
    private func loginButtonPressed() {
        print("Login button pressed, waiting for Password button to be pressed.")
    }
    
    @objc
    private func forgotPasswordButtonPressed() {
        print("Forgot password button pressed, waiting for New password button to be pressed.")
    }
    
    @objc
    private func facebookLoginButtonPressed() {
        print("Facebook login button pressed, waiting for Facebook password button to be pressed.")
    }
    
    @objc
    private func twitterLoginButtonPressed() {
        print("Twitter login button pressed, waiting for Twitter password button to be pressed.")
    }
    
    @objc
    private func signUpButtonPressed() {
        print("Sign up button pressed, loading ... ")
    }

}

