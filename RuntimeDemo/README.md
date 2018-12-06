#  Runtime
## 功能
- Method Swizzling和AOP实践
类似记录日志、身份验证、缓存等事务非常琐碎，与业务逻辑无关，很多地方都有，又很难抽象出一个模块，这种程序设计问题，业界给它们起了一个名字叫横向关注点(Cross-cutting concern)，AOP作用就是分离横向关注点(Cross-cutting concern)来提高模块复用性，它可以在既有的代码添加一些额外的行为(记录日志、身份验证、缓存)而无需修改代码。
-

## 危险性
- Method swizzling is not atomic
- Changes behavior of un-owned code
- Possible naming conflicts
- Swizzling changes the method's arguments
- The order of swizzles matters
- Difficult to understand (looks recursive)
- Difficult to debug
