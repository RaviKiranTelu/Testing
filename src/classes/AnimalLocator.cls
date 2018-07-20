public class AnimalLocator {
    
    public static String getAnimalNameById(Integer myId) {
        
        String animalName = '';
        Http http = NEW Http();
        HttpRequest httpRequest = NEW HttpRequest();
        httpRequest.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/' + myId);
        httpRequest.setMethod('GET');
        HttpResponse httpResponse = http.send(httpRequest);
        
        if(httpResponse.getStatusCode() == 200) {
               Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(httpResponse.getBody());
               Map<String, Object> animalObj = (Map<String, Object>) results.get('animalObj');
               animalName = String.valueOf(animalObj.get('name')); 
        }  
        
        return animalName;
    }
}