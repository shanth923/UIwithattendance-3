//
//  ViewController.swift
//  UIwithattendance
//
//  Created by R Shantha Kumar on 9/9/19.
//  Copyright © 2019 R Shantha Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var URLReqObject:URLRequest!
    var  dataTaskObj:URLSessionDataTask!
    var wholeData:[[String:Any]]!
    var holidayDetails = [[String:String]]()
    var lateComeDetailsLbl = [[String:String]]()
    var attendanceLoginTime = [[String:String]]()
    var leaveStatus = [[String:String]]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pulseLogin()
    
    }
   

    
    @IBAction func button(_ sender: Any)
    {
        wholeData = attendanceDetails()
       var  ypos = 100
        var ypost = 200
        var count = 1
        for x in wholeData
        {
            for (key,value) in x
            {
                if (key=="dayType")
                {
                    
                    if(x["dayType"] as! String == "Holiday")
                    {
                        var dictonary = [String:String]()
                        dictonary["date"] = x["attendanceDate"] as! String
                        dictonary["reason"] = x["reasonForNonAttendance"] as! String
                        
                        holidayDetails.append(dictonary)
                        
                        
                        let gap = 15
                        var xposForDay = 10
                        
                        
                        let  holdaysLbl = UILabel()
                        holdaysLbl.frame = CGRect(x: 10, y: 30, width: 130, height: 30)
                        holdaysLbl.backgroundColor = .orange
                        holdaysLbl.text = "Total Holidays"
                        view.addSubview(holdaysLbl)
    
                        let  holidayLbl = UILabel()
                        
                        holidayLbl.frame = CGRect(x: xposForDay, y: ypos, width: 90, height: 15)
                        holidayLbl.backgroundColor = .cyan
                        holidayLbl.text = dictonary["date"]
                        view.addSubview(holidayLbl)
                        
                        
                           var  xposForDay1 = 120
                        
                        let  holidayRsn = UILabel()
                        holidayRsn.frame = CGRect(x: xposForDay1, y: ypos, width: 200, height: 15)
                        holidayRsn.backgroundColor = .green
                        holidayRsn.text = dictonary["reason"]
                        ypos+=gap
                        view.addSubview(holidayRsn)
                       
                    }
                  
                }
                
            }
          
        }
        print(holidayDetails)
    }
    
    
    
    
    @IBAction func getLeaves(_ sender: Any) {
        
        wholeData = attendanceDetails()
        var  ypost = 300
        var yposts = 300
        var count = 1
        for x in wholeData
        {
            for (key,value) in x
            {
                
                if (key=="isLateCheckIn")
                {
   
                    if(type(of: value) != NSNull.self){
                    if(value as! Bool == true)
                    {
                        var dictonary = [String:String]()
                        dictonary["checkIn"] = x["checkIn"]! as! String
                        dictonary["timeSpent"] = x["timeSpent"]! as! String
                        dictonary["date"] = x["attendanceDate"]! as! String
                    
                        
                        attendanceLoginTime.append(dictonary)
                        
                        
                        let gap = 20
                        var xposForDay = 10
                        
                        
                        
                        let  checkLbl = UILabel()
                        checkLbl.frame = CGRect(x: 10, y: 250, width: 130, height: 30)
                        checkLbl.backgroundColor = .orange
                        checkLbl.text = "Late CheckIns"
                        view.addSubview(checkLbl)
                        
                        
                        
                        let  checkInLbl = UILabel()
                        checkInLbl.frame = CGRect(x: xposForDay, y: ypost, width: 90, height: 15)
                        checkInLbl.backgroundColor = .cyan
                        checkInLbl.text = dictonary["checkIn"]
                        view.addSubview(checkInLbl)
                        
                        
                        
                        var  xposForDay1 = 120
                        let  timeSpentLbl = UILabel()
                        timeSpentLbl.frame = CGRect(x: xposForDay1, y: ypost, width: 140, height: 15)
                        timeSpentLbl.backgroundColor = .green
                        timeSpentLbl.text = dictonary["timeSpent"]
                        ypost+=gap
                        view.addSubview(timeSpentLbl)
                        
                        var  xposForDay2 = 280
                        let  dateLbl = UILabel()
                        dateLbl.frame = CGRect(x: xposForDay2, y: yposts, width: 100, height: 15)
                        dateLbl.backgroundColor = .yellow
                        dateLbl.text = dictonary["date"]
                        yposts+=gap
                        view.addSubview(dateLbl)
                        
                        
                        
                        
                        
                        
                        
                        }}
                    
                    
                    
                }
                
            }
            
            
        }
        print(attendanceLoginTime)
        
        
        
    }
    
    @IBAction func attendanceLogin(_ sender: Any) {
        
        wholeData = attendanceDetails()
        
        var ypostn = 450
        var count = 1
        for x in wholeData
        {
            for (key,value) in x
            {
                if (key=="attendanceDate")
                {
                    
                    if(x["attendanceDate"] as! String == "05-Aug-19")
                    {
                        var dictonary = [String:String]()
                        dictonary["day"] = x["attendanceDay"] as! String
                        dictonary["timeSpent"] = x["timeSpent"] as! String
                        
                        holidayDetails.append(dictonary)
                        
                        
                        let gap = 15
                        var xposForDay = 10
                        
                        let  daynameLbl = UILabel()
                        daynameLbl.frame = CGRect(x: xposForDay, y: 370, width: 200, height: 30)
                        daynameLbl.backgroundColor = .orange
                        daynameLbl.text = "Minimum Time Spent"
                        view.addSubview(daynameLbl)
                    
                        
                        
                        let  dayLbl = UILabel()
                        dayLbl.frame = CGRect(x: xposForDay, y: ypostn, width: 90, height: 15)
                        dayLbl.backgroundColor = .cyan
                        dayLbl.text = dictonary["day"]
                        
                        view.addSubview(dayLbl)
                        var  xposForDay1 = 120
                        let  timeSpent = UILabel()
                        timeSpent.frame = CGRect(x: xposForDay1, y: ypostn, width: 130, height: 15)
                        timeSpent.backgroundColor = .green
                        timeSpent.text = dictonary["timeSpent"]
                        ypostn+=gap
                        view.addSubview(timeSpent)
                        
                        
                        
                        
                        
                    }
                    
                    
                    
                }
                
            }
            
            
        }
        print(holidayDetails)
        
        
    }
    
    
    @IBAction func leaveSts(_ sender: Any) {
        
        
        
        wholeData = attendanceDetails()
        var  ypost = 550
        var yposts = 550
        var count = 1
        for x in wholeData
        {
            for (key,value) in x
            {
                
                if (key=="reasonForNonAttendance")
                {
                    if(type(of: value) != NSNull.self)
                    {
                    
                if(x["reasonForNonAttendance"] as! String == "Casual Leave: planning to going village for festival.")
                {
             
                         var dictonary = [String:String]()
                            
                            dictonary["attendanceDate"] = x["attendanceDate"]! as! String
                            dictonary["reasonForNonAttendance"] = x["reasonForNonAttendance"]! as! String
                    dictonary["attendanceDay"] = x["attendanceDay"]! as! String
                            
                            
                             leaveStatus.append(dictonary)
                            
                            
                            let gap = 20
                            var xposForDay = 10
                    
                             let  daynameLbl = UILabel()
                             daynameLbl.frame = CGRect(x: xposForDay, y: 500, width: 170, height: 30)
                             daynameLbl.backgroundColor = .orange
                             daynameLbl.text = "Leaves Status"
                             view.addSubview(daynameLbl)
                    
                            
                            let  attendanceLbl = UILabel()
                            attendanceLbl.frame = CGRect(x: xposForDay, y: ypost, width: 90, height: 15)
                            attendanceLbl.backgroundColor = .cyan
                            attendanceLbl.text = dictonary["attendanceDate"]
                            view.addSubview(attendanceLbl)
                            
                            
                            
                            var  xposForDay1 = 120
                            let  reasonLbl = UILabel()
                            reasonLbl.frame = CGRect(x: xposForDay1, y: ypost, width: 140, height: 15)
                            reasonLbl.backgroundColor = .green
                            reasonLbl.text = dictonary["reasonForNonAttendance"]
                            ypost+=gap
                            view.addSubview(reasonLbl)
                            
                            var  xposForDay2 = 280
                            let  dayLbl = UILabel()
                            dayLbl.frame = CGRect(x: xposForDay2, y: yposts, width: 100, height: 15)
                            dayLbl.backgroundColor = .yellow
                            dayLbl.text = dictonary["attendanceDay"]
                            yposts+=gap
                            view.addSubview(dayLbl)
                            
                            
                            
                            
                            
                            
                            
                        }
                    }
                    
                }
                
                
            }
            
            
        }
        print(leaveStatus)
    }
    
    
    func pulseLogin()
    {
      
        URLReqObject = URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        URLReqObject.httpMethod="POST"
        var  dataToSend="registeredEmail=harshavardhanreddygangarapu@gmail.com&registeredPassword=Karvy@1a&funcName=verifyLogin"
        
        URLReqObject.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with:URLReqObject,completionHandler:{(data, conncetionDetails,error) in
            
            print("got data from server")
            
            do{
                var  convertedData = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments) as! [String:String]
                
                print(convertedData)
                
            }catch
            {
                print("something went wrong")
            }
            
        })
        dataTaskObj.resume()
        
        
    }
    func attendanceDetails() ->[[String : Any]]{
        
        var convertedData:[[String:Any]]!
        
        URLReqObject = URLRequest(url:URL(string:"https://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php")!)
        URLReqObject.httpMethod="POST"
        var  dataToSend="funcName=getUserAttendance&studentIDByAdmin=NoValue"
        
        URLReqObject.httpBody = dataToSend.data(using:String.Encoding.utf8)
        
        dataTaskObj = URLSession.shared.dataTask(with:URLReqObject,completionHandler:{(data, conncetionDetails,error) in
            
            print("got data from server")
            
            do{
                convertedData = try JSONSerialization.jsonObject(with:data!,options:JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
            
                print(convertedData)
               
            }catch
            {
                print("something went wrong")
            }
            
        })
        dataTaskObj.resume()
    
        while convertedData==nil{
            
        }
        
        return convertedData
    
    
    
    
    
    
}

}
