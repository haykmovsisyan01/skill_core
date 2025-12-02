# Skill Core

## This is my portfolio project. This project is not for a production, this is supposed to show my skills.
## In Skill Core you can read various articles and take different courses.

## Used libraries

-  firebase_core
-  flutter_bloc
-  flutter_native_splash
-  go_router
-  get_it
-  firebase_auth
-  flutter_riverpod
-  json_serializable
-  json_annotation
-  freezed_annotation
-  freezed
-  cloud_firestore
-  shared_preferences

### I used bloc and riverpod to demonstrate my knowledge in state management.

## I used clean architecture
```
lib
├── config                                       # config, strings and util functions
│   └── ...
│
├── data                                     
│   ├── sources                                  # layer that is used to relate with api
│   │   ├── local
│   │   │    └── shared_preferences.dart         # local storage
│   │   └── remote
│   │        ├── firebase_auth_client.dart       # firebase clients
│   │        └── firebase_firestore_client.dart
│   ├── models                                   # all models that are used in presentation
│   │   └── ...
│   ├── repositories                             # repositories implementation
│   │   └── ...      
│   └── exceptions.dart                          
├── domain                                       # main business logic
│   ├── entities                                 # entities that are used in api 
│   │   └── ...
│   ├── repositories                             # abstract repositories
│   │   └──             
│   └── usecases                                 # app main functionalities. These are used in presentation 
│       ├── auth
│           └── ...
│       ├── firestore
│           └── ...    
│       └── local
│           └── ...
├── presentation                                 # app ui layer 
│   ├── providers                                # state managment(DI is realized by riverpod)
│   │   └── ...
│   ├── widgets    
│   │   └── ...
│   ├── screens
│   │   └── ...
│   ├── routes.dart              
│   └── sc_app.dart                  
└── main.dart

```
