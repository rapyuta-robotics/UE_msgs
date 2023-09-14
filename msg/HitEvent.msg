# Ref 
# doc: https://docs.unrealengine.com/5.2/en-US/using-the-onhit-event/
# DECLARE_DYNAMIC_MULTICAST_SPARSE_DELEGATE_FiveParams( FComponentHitSignature, UPrimitiveComponent, OnComponentHit, UPrimitiveComponent*, HitComponent, AActor*, OtherActor, UPrimitiveComponent*, OtherComp, FVector, NormalImpulse, const FHitResult&, Hit );
# DECLARE_DYNAMIC_MULTICAST_SPARSE_DELEGATE_FourParams( FActorHitSignature, AActor, OnActorHit, AActor*, SelfActor, AActor*, OtherActor, FVector, NormalImpulse, const FHitResult&, Hit );

# common
string self_name # actor or component name
string other_actor_name
geometry_msgs/Vector3 normal_impluse
ue_msgs/HitResult hit_result

# component event only
string other_component_name # empty unless OnComponentHit event

