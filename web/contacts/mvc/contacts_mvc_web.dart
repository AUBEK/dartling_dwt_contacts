 
// web/contacts/mvc/contacts_mvc_web.dart 
 
import "dart:html"; 
 
import "package:dartling/dartling.dart"; 
import "package:dartling_default_app/dartling_default_app.dart"; 
 
import "package:contacts_mvc/contacts_mvc.dart"; 
 
initContactsData(ContactsRepo contactsRepo) { 
   var contactsModels = 
       contactsRepo.getDomainModels(ContactsRepo.contactsDomainCode); 
 
   var contactsMvcEntries = 
       contactsModels.getModelEntries(ContactsRepo.contactsMvcModelCode); 
   initContactsMvc(contactsMvcEntries); 
   contactsMvcEntries.display(); 
   contactsMvcEntries.displayJson(); 
} 
 
showContactsData(ContactsRepo contactsRepo) { 
   var mainView = new View(document, "main"); 
   mainView.repo = contactsRepo; 
   new RepoMainSection(mainView); 
} 
 
void main() { 
  var contactsRepo = new ContactsRepo(); 
  initContactsData(contactsRepo); 
  showContactsData(contactsRepo); 
} 
 
