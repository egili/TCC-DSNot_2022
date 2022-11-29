SELECT sObjectType, PermissionsCreate, PermissionsRead, PermissionsEdit, 
PermissionsDelete, PermissionsModifyAllRecords, PermissionsViewAllRecords 
FROM ObjectPermissions 
WHERE ParentId IN ( 
SELECT Id 
FROM PermissionSet 
WHERE PermissionSet.Profile.Name = 'System Administrator' 
) AND (sObjectType = 'Receitas__c' or sObjectType = 'Despesas__c' or sObjectType = 'Projeto__c' or sObjectType = 'FluxoCaixa__c' or sObjectType = 'PlanilhaOrcamentaria__c' or sObjectType = 'Documentacao__c')



SELECT sObjectType, PermissionsCreate, PermissionsRead, PermissionsEdit, 
PermissionsDelete, PermissionsModifyAllRecords, PermissionsViewAllRecords 
FROM ObjectPermissions 
WHERE ParentId IN ( 
SELECT Id 
FROM PermissionSet 
WHERE PermissionSet.Profile.Name = 'Usuário ONG' 
) AND (sObjectType = 'Receitas__c' or sObjectType = 'Despesas__c' or sObjectType = 'Projeto__c' or sObjectType = 'FluxoCaixa__c' or sObjectType = 'PlanilhaOrcamentaria__c' or sObjectType = 'Documentacao__c')


SELECT sObjectType, PermissionsCreate, PermissionsRead, PermissionsEdit, 
PermissionsDelete, PermissionsModifyAllRecords, PermissionsViewAllRecords 
FROM ObjectPermissions 
WHERE ParentId IN ( 
SELECT Id 
FROM PermissionSet 
WHERE PermissionSet.Profile.Name = 'Gestor ONG' 
) AND (sObjectType = 'Receitas__c' or sObjectType = 'Despesas__c' or sObjectType = 'Projeto__c' or sObjectType = 'FluxoCaixa__c' or sObjectType = 'PlanilhaOrcamentaria__c' or sObjectType = 'Documentacao__c')