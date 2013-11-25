part of contacts_mvc; 
 
// lib/gen/contacts/mvc/entries.dart 
 
class MvcEntries extends ModelEntries { 
 
  MvcEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = new Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Contact");
    entries["Contact"]= new Contacts(concept);
    return entries; 
  } 
 
  Entities newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Contact") { 
      return new Contacts(concept); 
    } 
  } 
 
  ConceptEntity newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Contact") { 
      return new Contact(concept); 
    } 
  } 
 
  fromJsonToData() { 
    fromJson(contactsMvcDataJson); 
  } 
 
 Contacts get contacts => getEntry("Contact");
  
} 
 
