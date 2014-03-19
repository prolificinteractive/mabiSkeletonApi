mabiSkeletonApi
===============

# MABI Application Documentation #

---

## Config Folder ##
* Copy `config.default.php` to `config.php` to start project
 * Edit database config to match environment setup

## Controllers Folder ##
* Contains all custom routers
* Will override default REST model-controllers if you name them `[Model]Controller.php` and name the class `[Model]Controller`, which extends `RESTModelController`

`File: FoodsController`
`class FoodController extends RESTModelController {}`

* Collection level uses normal getMethod but object level needs to be restGetMethod

## Models Folder ##
* Controllers will be auto-generated unless this code is above:
`/**`
` * @Model\NoController`
` */`

## Libraries ##
* For libraries in the project that don't fit in with Controllers or external ones that don't use composer
