part of contacts_mvc; 
 
// lib/gen/contacts/repository.dart 
 
class ContactsRepo extends Repo { 
 
  static final contactsDomainCode = "contacts"; 
  static final contactsMvcModelCode = "mvc"; 
 
  ContactsRepo([String code="ContactsRepo"]) : super(code) { 
    _initContactsDomain(); 
  } 
 
  _initContactsDomain() { 
    var contactsDomain = new Domain(contactsDomainCode); 
    domains.add(contactsDomain); 
    add(new ContactsModels(contactsDomain)); 
  } 
 
} 
 
