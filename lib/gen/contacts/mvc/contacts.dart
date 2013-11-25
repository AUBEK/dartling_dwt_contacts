part of contacts_mvc; 
 
// lib/gen/contacts/mvc/contacts.dart 
 
abstract class ContactGen extends ConceptEntity<Contact> { 
 
  ContactGen(Concept concept) : super.of(concept); 
 
  String get noCon => getAttribute("noCon"); 
  set noCon(String a) => setAttribute("noCon", a); 
  
  String get prenom => getAttribute("prenom"); 
  set prenom(String a) => setAttribute("prenom", a); 
  
  String get nom => getAttribute("nom"); 
  set nom(String a) => setAttribute("nom", a); 
  
  String get email => getAttribute("email"); 
  set email(String a) => setAttribute("email", a); 
  
  String get tel => getAttribute("tel"); 
  set tel(String a) => setAttribute("tel", a); 
  
  String get adresse => getAttribute("adresse"); 
  set adresse(String a) => setAttribute("adresse", a); 
  
  Contact newEntity() => new Contact(concept); 
  Contacts newEntities() => new Contacts(concept); 
  
} 
 
abstract class ContactsGen extends Entities<Contact> { 
 
  ContactsGen(Concept concept) : super.of(concept); 
 
  Contacts newEntities() => new Contacts(concept); 
  Contact newEntity() => new Contact(concept); 
  
} 
 
