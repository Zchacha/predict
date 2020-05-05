/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package serverpack;

import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author chacha
 */
@WebService(serviceName = "ServerWebService")
public class ServerWebService {

    @WebMethod(operationName = "operation")
    public String operation(@WebParam(name = "k") String k, @WebParam(name = "b") String b, @WebParam(name = "sex") String sex, @WebParam(name = "old") String old) {
        String result = "" ;
            if( null!=k)
                switch (k) {
            case "nongjok":
            case "kannayaw":
            case "bengkum":
                result = "Grab";
                break;
            case "kongsamwa":
                if (null != b)switch (b) {
            case "credit/debit":
                result = "Grab";
                break;
            case "bath":
                result = "food panda";
                break;
        }
                break;
            case "bangkapi":
                if (null != b)switch (b) {
            case "credit/debit":
                result = "food panda";
                break;
            case "bath":
                result = "Grab";
                break;
        }
                break;
            case "pawed":
            case "menbure":
                if (null != sex)switch (sex) {
            case "male":
                result = "Grab";
                break;
            case "female":
                result = "food panda";
                break;
        }
                break;
            case "ladkabang":
                if (null != old)switch (old) {
            case "<18":
            case "18-27":
                result = "Grab";
                break;
            case "28-36":
                if ("male".equals(sex))result = "Grab";
                else result = "LINEMAN";
                break;
            case "37-45":
                result = "LINEMAN";
                break;
        }
                break;
        }
            
        
     return result;
    }
}

    
    

