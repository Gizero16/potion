hpFrac = frac(objPlayer.hp);

for (i = 1; i <= objPlayer.hpMax; i++) {
    draw_sprite(
        sprHearts,
        (i > objPlayer.hp) + ((i == objPlayer.hp + 1) && (hpFrac > 0)),
        16 + ((i - 1) * 80),
        16
    );
}
