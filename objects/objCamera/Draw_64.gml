hpFrac = frac(objPlayer.hp);
var _playerHealth = objPlayer.hp 
_playerHealth -= hpFrac
for (i = 1; i <= objPlayer.hpMax; i++) {
    draw_sprite(
        sprHearts,
        (i > _playerHealth) + ((i == _playerHealth + 1) && (hpFrac > 0)),
        16 + ((i - 1) * 80),
        16
    );
}
