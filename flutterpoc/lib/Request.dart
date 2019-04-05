

class Request {
  apiRequest (String methodName, String accessToken, String imei, String dateTime) {
    String soapBody = '<$methodName><imei><![CDATA[$imei]]></imei><dateTime><![CDATA[$dateTime]]></dateTime><accessTokenHash><![CDATA[$accessToken]]></accessTokenHash></$methodName>';

    String envelope = '''<?xml version="1.0"?>
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
    <soapenv:Header/>
    <soapenv:Body>
        $soapBody
    </soapenv:Body>
    </soapenv:Envelope>''';
    return envelope;
  }
  validateStaffRequest (String methodName, String imei, String deviceToken, String dateTime, String emailAddress, String pwd) {
    String soapBody = '<$methodName><imei><![CDATA[$imei]]></imei><dateTime><![CDATA[$dateTime]]></dateTime><deviceTokenHash><![CDATA[$deviceToken]]></deviceTokenHash><emailAddress><![CDATA[$emailAddress]]></emailAddress><password><![CDATA[$pwd]]></password></$methodName>';

    
    String envelope = '''<?xml version="1.0"?>
    <soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/">
    <soapenv:Header/>
    <soapenv:Body>
        $soapBody
    </soapenv:Body>
    </soapenv:Envelope>''';
    return envelope;
  }


}