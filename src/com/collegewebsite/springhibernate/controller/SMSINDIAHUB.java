package com.collegewebsite.springhibernate.controller;
import java.io.BufferedReader;

import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
public class SMSINDIAHUB {

public String sendSms1(String phonenumbers, String msg){

try 
{
// Construct data
//String phonenumbers="XXXXXXXX";
String data="user=" + URLEncoder.encode("pranoy1994", "UTF-8");
data +="&password=" + URLEncoder.encode("koronadi123", "UTF-8");
data +="&message=" + URLEncoder.encode(msg, "UTF-8");
data +="&sender=" + URLEncoder.encode("INVITE", "UTF-8");
data +="&mobile=" + URLEncoder.encode(phonenumbers, "UTF-8");
data +="&type=" + URLEncoder.encode("3", "UTF-8");
// Send data
URL url = new URL("http://login.bulksmsgateway.in/sendmessage.php?"+data);
URLConnection conn = url.openConnection();
conn.setDoOutput(true);
OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
wr.write(data);
wr.flush();
// Get the response
BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
String line;
String sResult1="";
while ((line = rd.readLine()) != null) 
{
// Process line...
sResult1=sResult1+line+" ";
}
wr.close();
rd.close();
return sResult1;
} 
catch (Exception e)
{
System.out.println("Error SMS "+e);
return "Error "+e;
}
}
// TODO Auto-generated method stub
}
