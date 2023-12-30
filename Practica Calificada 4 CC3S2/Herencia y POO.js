class Pokemon {
  constructor(HP, ataque, defensa) {
    this.HP = HP;
    this.ataque = ataque;
    this.defensa = defensa;
    this.movimiento = "";
    this.nivel = 1;
    this.tipo = "";
  }

  flight() {
    throw new Error("No se especifica ningún movimiento.");
  }

  canFly() {
    if (!this.tipo) {
      throw new Error("No se especifica ningún tipo.");
    }
    return this.tipo.includes("flying");
  }
}

class Charizard extends Pokemon {
  constructor(HP, ataque, defensa, movimiento) {
    super(HP, ataque, defensa);
    this.movimiento = movimiento;
    this.tipo = "fire/flying"; // Se establece el tipo específico para Charizard
  }

  fight() {
    if (this.movimiento) {
      console.log(`Utilizando el movimiento: ${this.movimiento}`);
      return this.ataque;
    } else {
      throw new Error("No se especifica ningún movimiento.");
    }
  }
}

// Ejemplo de uso
const charizard = new Charizard(78, 84, 78, "Lanzallamas");

try {
  console.log(charizard.fight()); // Imprimirá el mensaje del movimiento y el valor de ataque
  console.log(charizard.canFly()); // Devolverá true, ya que el tipo incluye 'flying'
} catch (error) {
  console.error(error.message);
}

