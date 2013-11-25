part of contacts_mvc; 
 
// lib/gen/contacts/models.dart 
 
class ContactsModels extends DomainModels { 
 
  ContactsModels(Domain domain) : super(domain) { 
    add(fromJsonToMvcEntries()); 
  } 
 
  MvcEntries fromJsonToMvcEntries() { 
    return new MvcEntries(fromJsonToModel( 
      contactsMvcModelJson, 
      domain, 
      ContactsRepo.contactsMvcModelCode)); 
  } 
 
} 
 
