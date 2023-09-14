# Ref 
# doc: https://docs.unrealengine.com/5.0/en-US/API/Runtime/Engine/Components/UPrimitiveComponent/OnComponentBeginOverlap/

# DECLARE_DYNAMIC_MULTICAST_SPARSE_DELEGATE_SixParams( FComponentBeginOverlapSignature, UPrimitiveComponent, OnComponentBeginOverlap,     UPrimitiveComponent*, OverlappedComponent, AActor*, OtherActor, UPrimitiveComponent*, OtherComp, int32, OtherBodyIndex, bool, bFromSweep, const FHitResult &, SweepResult);
# DECLARE_DYNAMIC_MULTICAST_SPARSE_DELEGATE_FourParams( FComponentEndOverlapSignature, UPrimitiveComponent, OnComponentEndOverlap,        UPrimitiveComponent*, OverlappedComponent, AActor*, OtherActor, UPrimitiveComponent*, OtherComp, int32, OtherBodyIndex);

# DECLARE_DYNAMIC_MULTICAST_SPARSE_DELEGATE_TwoParams( FActorBeginOverlapSignature, AActor, OnActorBeginOverlap,                           AActor*, OverlappedActor, AActor*, OtherActor );
# DECLARE_DYNAMIC_MULTICAST_SPARSE_DELEGATE_TwoParams( FActorEndOverlapSignature, AActor, OnActorEndOverlap,                               AActor*, OverlappedActor, AActor*, OtherActor );

# common
bool begin # 0 for begin, 1 for end
string self_name # actor or component name
string other_actor_name

# component event only
string other_component_name 
int32 other_body_index 

# component begin event only
bool from_sweep
ue_msgs/HitResult sweep_result

