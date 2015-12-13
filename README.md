# CustomNotification

---

###三个类一个方法模拟iOS通知实现

#### 三个类:
```oc
/**
 *  @brief  关于通知的信息类
 */
@interface MyNotification : NSObject

@property (nonatomic, strong, readwrite) NSString *name;

@property (nonatomic, assign, readwrite) id object;

@property (nonatomic, strong, readwrite) NSDictionary *infoDictionary;

- (id)initWithName:(NSString *)name object:(id)anObject userInfo:(NSDictionary *)someUserInfo;

@end
```

```oc
/**
 *  @brief  存储关于注册的观察者的信息
 */
@interface MYNotificationObserverRecord : NSObject

@property (nonatomic, assign, readwrite) id object;

@property (nonatomic, assign, readwrite) id observer;

@property (nonatomic, assign, readwrite) SEL selector;

@end
```

```oc
/**
 *  @brief 单例模式 逻辑处理类
 */
@interface MYNotificationCenter : NSObject

@property (nonatomic, strong) NSMutableDictionary *observersDictionary;

- (id)defaultCenter;

- (void)addObserver:(id)notificationObserver selector:(SEL)notificationSelector name:(NSString *)notificationName object:(id)objectOfInterest;

- (void)removeObserver:(id)notificationObserver;

- (void)postNotification:(MyNotification *)aNotification;

- (void)postNotification:(NSString *)aName object:(id)objectOfInterest userInfo:(NSDictionary *)someUserInfo;

@end
```
一个方法:
```oc
- (id)performSelector:(SEL)aSelector withObject:(id)object;
```

###注意几点:

1.记得remove!记得remove!记得remove!

2.在接收通知的方法里加一个判断
`if (self.isViewLoaded && self.view.window) {}`

3.注意线程问题
