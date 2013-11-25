part of contacts_mvc;

// http://www.json.org/
// http://jsonformatter.curiousconcept.com/

// lib/contacts/mvc/json/model.dart

var contactsMvcModelJson = r'''
{
    "width":990,
    "height":580,
    "boxes":[
        {
            "name":"Contact",
            "entry":false,
            "x":401,
            "y":351,
            "width":120,
            "height":120,
            "items":[
                {
                    "sequence":10,
                    "name":"noCon",
                    "category":"required",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":20,
                    "name":"prenom",
                    "category":"required",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":30,
                    "name":"nom",
                    "category":"required",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":40,
                    "name":"email",
                    "category":"required",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":50,
                    "name":"tel",
                    "category":"required",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                },
                {
                    "sequence":60,
                    "name":"adresse",
                    "category":"required",
                    "type":"String",
                    "init":"",
                    "essential":true,
                    "sensitive":false
                }
            ]
        }
    ],
    "lines":[
        
    ]
}
''';
  