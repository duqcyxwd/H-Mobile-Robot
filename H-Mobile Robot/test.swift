//
//  File.swift
//  H-Mobile Robot
//
//  Created by Yongqinchuan Du on 2015-01-29.
//  Copyright (c) 2015 Yongqinchuan Du. All rights reserved.
//

import Foundation
import Darwin.C

func testudpserver(){
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), { () -> Void in
        var server:UDPServer=UDPServer(addr:"127.0.0.1",port:8080)
        var run:Bool=true
        while run{
            var (data,remoteip,remoteport)=server.recv(1024)
            println("recive")
            if let d=data{
                if let str=String(bytes: d, encoding: NSUTF8StringEncoding){
                    println(str)
                }
            }
            println(remoteip)
            server.close()
            break
        }
    })
}
func testudpclient(){
    var client:UDPClient=UDPClient(addr: "localhost", port: 55555)
    println("send hello world")
    client.send(str: "hello world")
    client.close()
}
//testudpserver()
//testudpclient()

//var stdinput=NSFileHandle.fileHandleWithStandardInput()
//stdinput.readDataToEndOfFile()

