for(integer i = 0; i < 10; i++){
    insert new Projeto__c(DataInicioProjeto__c = System.today() - 1, Name = 'projeto ' + i, StatusProjeto__c = 'Aprovado');
}

for(integer i = 0; i < 5; i++){
	insert new Projeto__c(DataInicioProjeto__c = System.today() - 1, Name = 'projetos ' + i, StatusProjeto__c = 'Finalizado');
}

for(integer i = 0; i < 7; i++){
	insert new Projeto__c(DataInicioProjeto__c = System.today() - 1, Name = 'projetor ' + i, StatusProjeto__c = 'Aguardando Resposta');
}

for(integer i = 0; i < 4; i++){
	insert new Projeto__c(DataInicioProjeto__c = System.today() - 1, Name = 'projetoa ' + i, StatusProjeto__c = 'Cancelado');
}