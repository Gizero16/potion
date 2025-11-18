hpFrac = frac(health);
var _playerHealth = health 
_playerHealth -= hpFrac
for (i = 1; i <= objPlayer.hpMax; i++) {
    draw_sprite(
        sprHeart,
        (i > _playerHealth) + ((i == _playerHealth + 1) && (hpFrac > 0)),
        16 + ((i - 1) * 80),
        16
    );
}
