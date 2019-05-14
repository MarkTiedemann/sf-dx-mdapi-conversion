# sf-dx-mdapi-conversion

**SalesForce DX to MD API and back to DX conversion example.**

## Reproduction

* Run `reproduction.sh` (on MacOS).
* Check the diff in `dx.diff`.

## Analysis

29 files changed in the conversion process. Most of these 29 changes are equivalent, however. For example:

* XML comments have been removed

```diff
-    <!--externalSharingModel>ReadWrite</externalSharingModel-->
```

* Empty non-self-enclosing XML tags have been self-enclosed

```diff
-                    <stringValue></stringValue>
+                    <stringValue/>
```

* Unnecessary XML metadata has been removed

```diff
-<?xml version="1.0" encoding="UTF-8"?>
-<CustomObject xmlns="http://soap.sforce.com/2006/04/metadata"/>
```

* Newlines at the end of files have been added

```diff
-</StaticResource>
\ No newline at end of file
+</StaticResource>
```

* Indentation has been adjusted and harmonized across files

```diff
-  <apiVersion>44.0</apiVersion>
-  <status>Active</status>
-</ApexTrigger>
+    <apiVersion>44.0</apiVersion>
+    <status>Active</status>
+</ApexTrigger>
```

* XML entities have been encoded

```diff
-    <formula>IMAGE( Picture__c , "picture" , 150, 150)</formula>
+    <formula>IMAGE( Picture__c , &quot;picture&quot; , 150, 150)</formula>
```

These changes seem to be neglectable. However, there are changes that may constitute actual changes:

```diff
+/*
+ Leaflet 1.0.0-rc.3+27f05a2, a JS library for interactive maps. http://leafletjs.com
+ (c) 2010-2015 Vladimir Agafonkin, (c) 2010-2011 CloudMade
+*/
+(function (window, document, undefined) {
+var L = {
+ version: "1.0.0-rc.3+27f05a2"
+};
+ ... [shortened for brevity]
```

It seems like the packaging of the Leaflet JavaScript library has been changed in the conversion process. Several thousand lines of code have been added and several binary files have been removed.
