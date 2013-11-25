 
// test/contacts/mvc/contacts_mvc_test.dart 
 
import "package:unittest/unittest.dart"; 
 
import "package:dartling/dartling.dart"; 
 
import "package:contacts_mvc/contacts_mvc.dart"; 
 
testContactsMvc(Repo repo, String domainCode, String modelCode) { 
  var models; 
  var session; 
  var entries; 
  group("Testing ${domainCode}.${modelCode}", () { 
    setUp(() { 
      models = repo.getDomainModels(domainCode); 
      session = models.newSession(); 
      entries = models.getModelEntries(modelCode); 
      expect(entries, isNotNull); 
 
 
    }); 
    tearDown(() { 
      entries.clear(); 
    }); 
    test("Empty Entries Test", () { 
      expect(entries.isEmpty, isTrue); 
    }); 
 
  }); 
} 
 
testContactsData(ContactsRepo contactsRepo) { 
  testContactsMvc(contactsRepo, ContactsRepo.contactsDomainCode, 
      ContactsRepo.contactsMvcModelCode); 
} 
 
void main() { 
  var contactsRepo = new ContactsRepo(); 
  testContactsData(contactsRepo); 
} 
 
