//
//  PredicateVC.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 14.01.2023.
//

import UIKit

class PredicateVC: UIViewController {

    private let doneButton: UIBarButtonItem = {
        let item = UIBarButtonItem(title: "Done", style: .plain, target: nil, action: #selector(predicate))
        return item
    }()
    
    
    //MARK: - Labels
    private let catAgeLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.text = "Cat Age = "
        return label
    }()
    
    private let catHeartRateLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.text = "Cat Heart Rate = "
        return label
    }()
    
    private let catFunRateLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.text = "Cat Fun Rate = "
        return label
    }()
    
    private let catLovelinessRateLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.text = "Cat Loveliness rate = "
        return label
    }()
    
    
    //MARK: - Steppers
    private let ageStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 16
        stepper.stepValue = 1
        stepper.value = 8
        return stepper
    }()
    
    private let heartStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 6
        stepper.stepValue = 1
        stepper.value = 3
        return stepper
    }()
    
    private let funStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 6
        stepper.stepValue = 1
        stepper.value = 3
        return stepper
    }()
    
    private let lovelinessStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 6
        stepper.stepValue = 1
        stepper.value = 3
        return stepper
    }()
    
    
    //MARK: - Steppers Labels
    private let ageStepperLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let heartStepperLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let funStepperLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let lovelinessStepperLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    //MARK: - @objc
    @objc private func predicate(){
        print("Predicate!")
    }

    @objc private func ageStepperSelector(){
        if ageStepper.value == 16 {
            ageStepperLabel.text = "All"
        } else {
            ageStepperLabel.text = "\(Int(ageStepper.value)) years"
        }
    }
    
    @objc private func heartStepperSelector(){
        if heartStepper.value == 6 {
            heartStepperLabel.text = "All"
        } else {
            heartStepperLabel.text = "\(Int(heartStepper.value)) hearts"
        }
    }
    
    @objc private func funStepperSelector(){
        if funStepper.value == 6 {
            funStepperLabel.text = "All"
        } else {
            funStepperLabel.text = "\(Int(funStepper.value)) fun's"
        }
    }
    
    @objc private func lovelinessStepperSelector(){
        if lovelinessStepper.value == 6 {
            lovelinessStepperLabel.text = "All"
        } else {
            lovelinessStepperLabel.text = "\(Int(lovelinessStepper.value)) loveliness's"
        }
    }
    //MARK: - SetupUI
    private func setupUI() {
        self.view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.title = "Predicate options"
        
        self.doneButton.target = self
        self.navigationItem.rightBarButtonItem = doneButton
        
        setupCatAgeLabel()
        setupCatHeartRateLabel()
        setupCatFunRateLabel()
        setupCatLovelinessRateLabel()
        
        setupAgeStepper()
        setupHeartStepper()
        setupFunStepper()
        setupLovelinessStepper()
        
        setupAgeStepperLabel()
        setupHeartStepperLabel()
        setupFunStepperLabel()
        setupLovelinessStepperLabel()
    }
    //MARK: Setup Labels
    private func setupCatAgeLabel(){
        self.view.addSubview(catAgeLabel)
        catAgeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        catAgeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        catAgeLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 15).isActive = true
        catAgeLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.35).isActive = true
        catAgeLabel.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.07).isActive = true
            
    }
    
    private func setupCatHeartRateLabel(){
        self.view.addSubview(catHeartRateLabel)
        catHeartRateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        catHeartRateLabel.topAnchor.constraint(equalTo: catAgeLabel.bottomAnchor, constant: 30).isActive = true
        catHeartRateLabel.centerXAnchor.constraint(equalTo: catAgeLabel.centerXAnchor).isActive = true
        catHeartRateLabel.widthAnchor.constraint(equalTo: catAgeLabel.widthAnchor).isActive = true
        catHeartRateLabel.heightAnchor.constraint(equalTo: catAgeLabel.heightAnchor).isActive = true
        
    }
    
    private func setupCatFunRateLabel(){
        self.view.addSubview(catFunRateLabel)
        catFunRateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        catFunRateLabel.topAnchor.constraint(equalTo: catHeartRateLabel.bottomAnchor, constant: 30).isActive = true
        catFunRateLabel.centerXAnchor.constraint(equalTo: catAgeLabel.centerXAnchor).isActive = true
        catFunRateLabel.widthAnchor.constraint(equalTo: catAgeLabel.widthAnchor).isActive = true
        catFunRateLabel.heightAnchor.constraint(equalTo: catAgeLabel.heightAnchor).isActive = true
        
    }
    
    private func setupCatLovelinessRateLabel(){
        self.view.addSubview(catLovelinessRateLabel)
        catLovelinessRateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        catLovelinessRateLabel.topAnchor.constraint(equalTo: catFunRateLabel.bottomAnchor, constant: 30).isActive = true
        catLovelinessRateLabel.centerXAnchor.constraint(equalTo: catAgeLabel.centerXAnchor).isActive = true
        catLovelinessRateLabel.widthAnchor.constraint(equalTo: catAgeLabel.widthAnchor).isActive = true
        catLovelinessRateLabel.heightAnchor.constraint(equalTo: catAgeLabel.heightAnchor).isActive = true
    }
    
    
    //MARK: Setup Steppers
    private func setupAgeStepper(){
        self.view.addSubview(ageStepper)
        ageStepper.translatesAutoresizingMaskIntoConstraints = false
        
        ageStepper.centerYAnchor.constraint(equalTo: catAgeLabel.centerYAnchor).isActive = true
        ageStepper.leadingAnchor.constraint(equalTo: catAgeLabel.trailingAnchor, constant: 10).isActive = true
        
        
        ageStepper.addTarget(self, action: #selector(ageStepperSelector), for: .touchUpInside)
    }
    
    private func setupHeartStepper(){
        self.view.addSubview(heartStepper)
        heartStepper.translatesAutoresizingMaskIntoConstraints = false
        
        heartStepper.centerYAnchor.constraint(equalTo: catHeartRateLabel.centerYAnchor).isActive = true
        heartStepper.centerXAnchor.constraint(equalTo: ageStepper.centerXAnchor).isActive = true
        
        heartStepper.addTarget(self, action: #selector(heartStepperSelector), for: .touchUpInside)
    }
    
    private func setupFunStepper(){
        self.view.addSubview(funStepper)
        funStepper.translatesAutoresizingMaskIntoConstraints = false
        
        funStepper.centerYAnchor.constraint(equalTo: catFunRateLabel.centerYAnchor).isActive = true
        funStepper.centerXAnchor.constraint(equalTo: ageStepper.centerXAnchor).isActive = true
        
        funStepper.addTarget(self, action: #selector(funStepperSelector), for: .touchUpInside)
    }
    
    private func setupLovelinessStepper(){
        self.view.addSubview(lovelinessStepper)
        lovelinessStepper.translatesAutoresizingMaskIntoConstraints = false
        
        lovelinessStepper.centerYAnchor.constraint(equalTo: catLovelinessRateLabel.centerYAnchor).isActive = true
        lovelinessStepper.centerXAnchor.constraint(equalTo: ageStepper.centerXAnchor).isActive = true
        
        lovelinessStepper.addTarget(self, action: #selector(lovelinessStepperSelector), for: .touchUpInside)
    }
    
    //MARK: Setup Steppers Labels
    private func setupAgeStepperLabel(){
        self.view.addSubview(ageStepperLabel)
        ageStepperLabel.translatesAutoresizingMaskIntoConstraints = false
        
        ageStepperLabel.centerYAnchor.constraint(equalTo: catAgeLabel.centerYAnchor).isActive = true
        ageStepperLabel.leadingAnchor.constraint(equalTo: ageStepper.trailingAnchor, constant: 15).isActive = true
        ageStepperLabel.widthAnchor.constraint(equalTo: catAgeLabel.widthAnchor).isActive = true
        ageStepperLabel.heightAnchor.constraint(equalTo: catAgeLabel.heightAnchor).isActive = true
        
        ageStepperLabel.text = "\(Int(ageStepper.value)) years"
    }
    
    private func setupHeartStepperLabel() {
        self.view.addSubview(heartStepperLabel)
        heartStepperLabel.translatesAutoresizingMaskIntoConstraints = false
        
        heartStepperLabel.centerXAnchor.constraint(equalTo: ageStepperLabel.centerXAnchor).isActive = true
        heartStepperLabel.heightAnchor.constraint(equalTo: ageStepperLabel.heightAnchor).isActive = true
        heartStepperLabel.widthAnchor.constraint(equalTo: ageStepperLabel.widthAnchor).isActive = true
        heartStepperLabel.centerYAnchor.constraint(equalTo: catHeartRateLabel.centerYAnchor).isActive = true
        
        heartStepperLabel.text = "\(Int(heartStepper.value)) heart's"
    }
  
    private func setupFunStepperLabel() {
        self.view.addSubview(funStepperLabel)
        funStepperLabel.translatesAutoresizingMaskIntoConstraints = false
        
        funStepperLabel.centerXAnchor.constraint(equalTo: ageStepperLabel.centerXAnchor).isActive = true
        funStepperLabel.heightAnchor.constraint(equalTo: ageStepperLabel.heightAnchor).isActive = true
        funStepperLabel.widthAnchor.constraint(equalTo: ageStepperLabel.widthAnchor).isActive = true
        funStepperLabel.centerYAnchor.constraint(equalTo: catFunRateLabel.centerYAnchor).isActive = true
        
        funStepperLabel.text = "\(Int(funStepper.value)) fun's"
    }
    
    private func setupLovelinessStepperLabel() {
        self.view.addSubview(lovelinessStepperLabel)
        lovelinessStepperLabel.translatesAutoresizingMaskIntoConstraints = false
        
        lovelinessStepperLabel.centerXAnchor.constraint(equalTo: ageStepperLabel.centerXAnchor).isActive = true
        lovelinessStepperLabel.heightAnchor.constraint(equalTo: ageStepperLabel.heightAnchor).isActive = true
        lovelinessStepperLabel.widthAnchor.constraint(equalTo: ageStepperLabel.widthAnchor).isActive = true
        lovelinessStepperLabel.centerYAnchor.constraint(equalTo: catLovelinessRateLabel.centerYAnchor).isActive = true
        
        lovelinessStepperLabel.text = "\(Int(lovelinessStepper.value)) loveliness's"
    }
}
