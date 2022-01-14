class SniperRifle extends Weapon {
  
  SniperRifle() {
    
    super(SNIPER_THRESHOLD,SNIPER_BULLET_SPEED,pink,pink,10);
    damage = 10;
  }
  
}

class AutoPistol extends Weapon {
 
  AutoPistol() {
    super(AUTOPISTOL_THRESHOLD,AUTOPISTOL_BULLET_SPEED,Twhite,black,10);
    damage = 5;
  }
  
}

class PWeapon extends Weapon {
  
  PWeapon() {
    super(10,4,coral,pink,5);
    damage = 1;
  }
}
