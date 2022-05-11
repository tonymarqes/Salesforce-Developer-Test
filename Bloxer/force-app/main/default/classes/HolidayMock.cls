@isTest
public with sharing class HolidayMock implements HttpCalloutMock{
    private Integer httpCode;

    public HolidayMock(Integer httpCode) {
        this.httpCode = httpCode;
    }

    public HTTPResponse respond(HTTPRequest req) {
        HTTPResponse res = new HTTPResponse();

        switch on httpCode{
            when 000{
                return getDifferentStructure();
            }
            when 404{
                return getNotSupportedErrorCall();
            }
            when 500{
                return getUnexpectedErrorCall();
            }
            when else{
                return getSuccessfullCall();
            }
        }
    }

    public HTTPResponse getSuccessfullCall(){
        HTTPResponse res = new HTTPResponse();
        res.setStatus('OK');
        res.setStatusCode(200);
        res.setHeader('Content-type', 'application/json');
        res.setBody(
            '['+
                '{' +
                    '"date": "2022-01-01",' + 
                    '"name": "Confraternização mundial",'+
                    '"type": "national"'+
                '}'+
            ']'
        );
        return res;
    }

    public HTTPResponse getNotSupportedErrorCall(){
        HTTPResponse res = new HTTPResponse();
        res.setStatus('Not Found');
        res.setStatusCode(404);
        res.setHeader('Content-type', 'application/json');
        res.setBody(
            '{'+
            '"message": "Ano fora do intervalo suportado entre 1900 e 2199.",'+
            '"type": "feriados_range_error",'+
            '"name": "NotFoundError"'+
            '}'
        );
        return res;
    }

    public HTTPResponse getUnexpectedErrorCall(){
        HTTPResponse res = new HTTPResponse();
        res.setStatus('Internal Error Server');
        res.setStatusCode(500);
        res.setHeader('Content-type', 'application/json');
        res.setBody(
            '{'+
            '"message": "Erro ao calcular feriados.",'+
            '"type": "feriados_error",'+
            '"name":  "InternalError"'+
            '}'
        );
        return res;
    }

    public HTTPResponse getDifferentStructure(){
        HTTPResponse res = new HTTPResponse();
        res.setStatus('OK');
        res.setStatusCode(200);
        res.setHeader('Content-type', 'application/json');
        res.setBody(
                '{' +
                    '"date": "2022-01-01",' + 
                    '"name": "Confraternização mundial",'+
                    '"type": "national"'+
                '}'
        );
        return res;
    }



}
