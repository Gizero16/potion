if (target != noone) {
    x = target.x;
    y = target.y;

    if (!target.poisoned) {
        instance_destroy();
    }
}
