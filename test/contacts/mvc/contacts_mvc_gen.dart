 
// test/contacts/mvc/contacts_mvc_gen.dart 
 
import "package:dartling/dartling.dart"; 
 
import "package:contacts_mvc/contacts_mvc.dart"; 
 
genCode() { 
  var repo = new Repo(); 
 
  var contactsDomain = new Domain("Contacts"); 
 
  Model contactsMvcModel = 
      fromJsonToModel(contactsMvcModelJson, contactsDomain, "Mvc"); 
 
  repo.domains.add(contactsDomain); 
 
  repo.gen("contacts_mvc"); 
} 
 
initContactsData(ContactsRepo contactsRepo) { 
   var contactsModels = 
       contactsRepo.getDomainModels(ContactsRepo.contactsDomainCode); 
 
   var contactsMvcEntries = 
       contactsModels.getModelEntries(ContactsRepo.contactsMvcModelCode); 
   initContactsMvc(contactsMvcEntries); 
   contactsMvcEntries.display(); 
   contactsMvcEntries.displayJson(); 
} 
 
void main() { 
  genCode(); 
 
  var contactsRepo = new ContactsRepo(); 
  initContactsData(contactsRepo); 
} 
 
