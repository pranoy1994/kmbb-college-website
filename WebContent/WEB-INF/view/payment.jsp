<%@ page import="java.util.*" %>
<%@ page import="java.security.*" %>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>KMBB | PayUmoney</title>

</head>
<%!
public boolean empty(String s)
	{
		if(s== null || s.trim().equals(""))
			return true;
		else
			return false;
	}
%>
<%!
	public String hashCal(String type,String str){
		byte[] hashseq=str.getBytes();
		StringBuffer hexString = new StringBuffer();
		try{
		MessageDigest algorithm = MessageDigest.getInstance(type);
		algorithm.reset();
		algorithm.update(hashseq);
		byte messageDigest[] = algorithm.digest();
            
		

		for (int i=0;i<messageDigest.length;i++) {
			String hex=Integer.toHexString(0xFF & messageDigest[i]);
			if(hex.length()==1) hexString.append("0");
			hexString.append(hex);
		}
			
		}catch(NoSuchAlgorithmException nsae){ }
		
		return hexString.toString();


	}
%>
<% 	
	String merchant_key="gBGaGgfp";
	String salt="WOSXSaFKpH";
	String action1 ="";
	String base_url="https://test.payu.in";
	int error=0;
	String hashString="";
	
	
	Enumeration paramNames = request.getParameterNames();
	Map<String,String> params= new HashMap<String,String>();
    	while(paramNames.hasMoreElements()) 
	{
      		String paramName = (String)paramNames.nextElement();
      
      		String paramValue = request.getParameter(paramName);

		params.put(paramName,paramValue);
	}
	String txnid ="";
	if(empty(params.get("txnid"))){
		Random rand = new Random();
		String rndm = Integer.toString(rand.nextInt())+(System.currentTimeMillis() / 1000L);
		txnid=hashCal("SHA-256",rndm).substring(0,20);
	}
	else
		txnid=params.get("txnid");
       String udf2 = txnid;
	String txn="abcd";
	String hash="";
	String hashSequence = "key|txnid|amount|productinfo|firstname|email|udf1|udf2|udf3|udf4|udf5|udf6|udf7|udf8|udf9|udf10";
	if(empty(params.get("hash")) && params.size()>0)
	{
		if( empty(params.get("key"))
			|| empty(params.get("txnid"))
			|| empty(params.get("amount"))
			|| empty(params.get("firstname"))
			|| empty(params.get("email"))
			|| empty(params.get("phone"))
			|| empty(params.get("productinfo"))
			|| empty(params.get("surl"))
			|| empty(params.get("furl"))
			|| empty(params.get("service_provider"))
	)
			
			error=1;
		else{
			String[] hashVarSeq=hashSequence.split("\\|");
			
			for(String part : hashVarSeq)
			{
				hashString= (empty(params.get(part)))?hashString.concat(""):hashString.concat(params.get(part));
				hashString=hashString.concat("|");
			}
			hashString=hashString.concat(salt);
			

			 hash=hashCal("SHA-512",hashString);
			action1=base_url.concat("/_payment");
		}
	}
	else if(!empty(params.get("hash")))
	{
		hash=params.get("hash");
		action1=base_url.concat("/_payment");
	}
		

%>
<html>

<script>
var hash='<%= hash %>';
function submitPayuForm() {
	
	if (hash == '')
		return;

      var payuForm = document.forms.payuForm;
      payuForm.submit();
    }
</script>

<body onload="submitPayuForm();">

<div>
<form action="<%= action1 %>" method="post" name="payuForm">
<input type="hidden" name="key" value="<%= merchant_key %>" />
      <input type="hidden" name="hash" value="<%= hash %>"/>
      <input type="hidden" name="txnid" value="<%= txnid %>" />
      <input type="hidden" name="udf2" value="<%= txnid %>" />
	  <input type="hidden" name="service_provider" value="payu_paisa" />
     
     
        <input type="hidden" name="amount" value="<%= (empty(params.get("amount"))) ? "" : params.get("amount") %>" />
         
          <input  type="hidden" name="firstname" id="firstname" value="<%= (empty(params.get("firstname"))) ? "" : params.get("firstname") %>" />
     
         
          <input  type="hidden" name="email" id="email" value="<%= (empty(params.get("email"))) ? "" : params.get("email") %>" />
        
          <input  type="hidden" name="phone" value="<%= (empty(params.get("phone"))) ? "" : params.get("phone") %>" />
        
        
          
         <input  type="hidden" name="productinfo" value="<%= (empty(params.get("productinfo"))) ? "" : params.get("productinfo") %>" size="64" />
      
         
          <input  type="hidden" name="surl" value="<%= (empty(params.get("surl"))) ? "" : params.get("surl") %>" size="64" />
       
        <input  type="hidden" name="furl" value="<%= (empty(params.get("furl"))) ? "" : params.get("furl") %>" size="64" />
     
      <div class="container">
   <center>  <br><img src="http://kmbb.in/images/top-logo.jpg"/>&nbsp&nbsp&nbsp&nbsp&nbsp <img src=" http://s11.postimg.org/6eww6a8sj/inverse_logo.jpg" width="200px" height="50px"><br>
     </center>
      <br>
      <table class="table table-bordered">
      <tbody>
      <tr><td>
             Amount: <%= (empty(params.get("amount"))) ? "" : params.get("amount") %><br>
             </td></tr><tr><td>
       Email: <%= (empty(params.get("email"))) ? "" : params.get("email") %><br>
       </td></tr><tr><td>
       Phone:<%= (empty(params.get("phone"))) ? "" : params.get("phone") %><br>
       </td></tr><tr><td>
        <% if(empty(hash)){ %>
          <input class="btn btn-info" type="submit" value="Proceed" />
          <% } %>
          </td></tr>
          </tbody>
        </table>
      <center><p>You will be redirected to our secure payment gateway powered by PayUmoney, kindly please check your details and click Proceed</p></center>
      </div>
     
     
         
    </form>
</div>

</body>
</html>