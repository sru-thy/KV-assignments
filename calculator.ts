interface CalculatorInterface {
    add(a: number, b: number): number
    sub(a: number, b: number): number
    mul(a: number, b: number): number
    div(a: number, b: number): number
    mod(a: number, b: number): number
}

class Calculator implements CalculatorInterface {
    add(a: number, b: number): number {
        return a + b
    }
    sub(a: number, b: number): number {
        return a - b
    }
    mul(a: number, b: number): number {
        return a * b
    }
    div(a: number, b: number): number {
        if( b != 0) return a / b
        throw new Error("Division by zero")
    }
    mod(a: number, b: number): number {
        return a % b
    }   
}

var calculator : CalculatorInterface = new Calculator();
console.log(calculator.add(2,3));
console.log(calculator.sub(2,3));
console.log(calculator.mul(2,3));
console.log(calculator.div(2,0));
