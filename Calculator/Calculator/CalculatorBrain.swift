//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Joacim Nidén on 15/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    //Determine what's coming in
    private enum Op: CustomStringConvertible {
        case Operand (Double)
        case UnaryOperation (String, Double -> Double)
        case BinaryOperation (String, (Double, Double) -> Double)
        
        var description: String{
            get {
                switch self{
                case .Operand(let operand):
                    return "\(operand)"
                case .UnaryOperation(let symbol, _):
                    return symbol
                case .BinaryOperation(let symbol, _):
                    return symbol
                }
                
            }
        }
    }
    
    private var opStack = [Op]()
    
    private var knownOps = [String:Op]()
    
    init(){
        func learnOp(op: Op){
            knownOps[op.description] = op
        }
        learnOp(Op.BinaryOperation("×",*))
        learnOp(Op.BinaryOperation("÷") {$1 / $0})
        learnOp(Op.BinaryOperation("+",+))
        learnOp(Op.BinaryOperation("−") {$1 - $0})
        learnOp(Op.UnaryOperation("√", sqrt))
    }
    


    private func evaluate(var ops: [Op]) -> (result: Double?, remainingOps: [Op]){
        if !ops.isEmpty {
            var remainingOps = ops
            let op = remainingOps.removeLast()
            
            switch op{
            case .Operand(let operand):
                return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvalutation = evaluate(remainingOps)
                if let operand = operandEvalutation.result {
                    return (operation(operand), operandEvalutation.remainingOps)
                        
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evalutation = evaluate(op1Evaluation.remainingOps)
                    if let operand2 = op2Evalutation.result {
                        return (operation(operand1,operand2), op2Evalutation.remainingOps)
                    }
                }
                
                
            }
            
        }
        return (nil, ops)
    }
    
    func evaluate() -> Double?{
        //These name do not have to be the same as parameter names
        let (result, remainder) = evaluate(opStack)
        print("\(opStack) = \(result) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand: Double) -> Double?{
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double?{
        if let operation = knownOps[symbol] {
            opStack.append(operation)
        }
        return evaluate()
        
    }
    
    
}
