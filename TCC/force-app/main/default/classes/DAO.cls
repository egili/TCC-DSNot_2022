/**
 * interface responsavel por implementar o comportamento de uma classe DAO
 */ 

public interface DAO {

    List<SObject> get(String recordId);
}