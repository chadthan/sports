//
//  CTForumViewController.swift
//  Sports
//
//  Created by Chad on 4/9/16.
//  Copyright © 2016 CT. All rights reserved.
//

import UIKit

class CTForumViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate {
    
    var chatTable: UITableView!
    var commentsArray = Array<String!>()
    var selectedImage: String!
    var sportImage: UIImageView!


    // MARK: -My Stuff
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath){
        let comment = self.commentsArray[indexPath.row]
        cell.textLabel?.text = comment
        cell.detailTextLabel?.text = "This is more details"
    }
    
    // MARK: - LifeCycle Method
    
    override func loadView(){
        super.loadView()
        
        self.commentsArray.append("Ball!")
        self.commentsArray.append("This is good")
        self.commentsArray.append("Score!")
        self.commentsArray.append("Ouch")
    
        let frame = UIScreen.mainScreen().bounds
        let view = UIView(frame: frame)
        view.backgroundColor = UIColor.whiteColor()
        
        self.chatTable = UITableView(frame:frame, style: .Plain)
        self.chatTable.dataSource = self
        self.chatTable.delegate = self
        
        
        let chatBox = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: 64))
        chatBox.backgroundColor = UIColor.yellowColor()
        self.chatTable.tableHeaderView = chatBox
        
        let chatField = UITextField(frame: CGRect(x:10, y:10, width: 300, height:44))
        chatField.delegate = self
        chatField.borderStyle = .RoundedRect
        chatBox.addSubview(chatField)
        
        self.chatTable.tableHeaderView = chatBox
        
        view.addSubview(self.chatTable)
        
        self.view = view
    }
    
    // MARK: Datasource Method
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.commentsArray.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            self.configureCell(cell, indexPath: indexPath)
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        self.configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        return 88
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        print("didSelectRowAtIndexPath: \(indexPath.row)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()// makes keyboard go away
        
        let comment = textField.text
        
        if (comment?.characters.count == 0){
        
            let alert = UIAlertController(title: "Help", message: "I'm trapped", preferredStyle: .Alert)
            
            let okBtn = UIAlertAction(title: "I'll help you", style: .Default, handler: nil)
            alert.addAction(okBtn)
            
            self.presentViewController(alert, animated:true,completion:nil)
            return true
            
        }
        
        self.commentsArray.append(comment!)
        self.chatTable.reloadData()
        textField.text = nil
        
        return true
    }

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
