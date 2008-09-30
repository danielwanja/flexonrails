package 
{
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.utils.ByteArray;
	
	/**
	 * Based on http://www.actionscript.org/forums/showpost.php3?p=636159&postcount=4
	 */
	public class MultiPartRequestData
	{
		
		static public function getRequest(url:String, bytesToSend:ByteArray):URLRequest {
			var boundary: String = '---------------------------7d76d1b56035e';
			var header1: String  = '--'+boundary + '\r\n'
									+'Content-Disposition: form-data; name="Filename"\r\n\r\n'
									+'picture.png\r\n'
									+'--'+boundary + '\r\n'
									+'Content-Disposition: form-data; name="asset[uploaded_data]"; filename="picture.png"\r\n'
									+'Content-Type: application/octet-stream\r\n\r\n'
		    //In a normal POST header, you'd find the image data here
			var header2: String =	'--'+boundary + '\r\n'
									+'Content-Disposition: form-data; name="Upload"\r\n\r\n'
									+'Submit Query\r\n'
									+'--'+boundary + '--';
trace(header1)									
trace("************")
trace(header2)									
trace("*****END*******")
			//Encoding the two string parts of the header
			var headerBytes1: ByteArray = new ByteArray();
			headerBytes1.writeMultiByte(header1, "ascii");
			
			var headerBytes2: ByteArray = new ByteArray();
			headerBytes2.writeMultiByte(header2, "ascii");
			
		        //Creating one final ByteArray 
			var sendBytes: ByteArray = new ByteArray();
trace("len:"+headerBytes1.length+" :"+bytesToSend.length+" :"+headerBytes2.length)			
			sendBytes.writeBytes(headerBytes1, 0, headerBytes1.length);
			sendBytes.writeBytes(bytesToSend, 0, bytesToSend.length);
			sendBytes.writeBytes(headerBytes2, 0, headerBytes2.length);
			
			var request: URLRequest = new URLRequest(url);
			request.data = sendBytes;
			request.method = URLRequestMethod.POST;
			request.contentType = "multipart/form-data; boundary=" + boundary;		
			return request;	
		}		


	}
}