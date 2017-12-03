import java.io.*;
import java.util.Scanner;

public class impares {
    public static void main(String[] args) {
    	Scanner scanner = new Scanner(System.in);

        System.out.println("Ingresa primer numero: ");
        String numero1 = scanner.nextLine();
        
        System.out.println("Ingresa segundo numero: ");
        String numero2 = scanner.nextLine();

        int num1 = Integer.parseInt(numero1);
        int num2 = Integer.parseInt(numero2);

        if (num2 < num1) {
        	System.out.println("El segundo numero no puede ser menor que el primero");
        }else{
        	for(int i=num1; i <=num2; i++) {
	            if ((i % 2) != 0)
				{
					System.out.println("Impar:" + i );
				}
	        }
        }
    }
}
