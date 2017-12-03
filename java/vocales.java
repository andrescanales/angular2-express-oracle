import java.io.*;
import java.util.Scanner;

public class vocales {
    public static void main(String[] args) {
        System.out.println("Ingresa una cadena de texto: ");
        Scanner scanner = new Scanner(System.in);
        String cadena = scanner.nextLine();
        
        int a = 0;
        int e = 0;
        int i = 0;
        int o = 0;
        int u = 0;
        for(int j=0; j <cadena.length(); j++) {
            if(cadena.charAt(j) == 'a'){
                a = a + 1;
            } else if(cadena.charAt(j) == 'e') {
                e = e + 1;
            } else if (cadena.charAt(j) == 'i') {
                i = i + 1;
            } else if (cadena.charAt(j) == 'o') {
                o = o + 1;
            } else if (cadena.charAt(j) == 'u') {
                u = u + 1;
            }
        }
        System.out.println("Cadena ingresada: " + cadena );
        System.out.println("Esta cadena contiene: " + "a:" + a + " e:" + e + " i:" + i + " o:" + o + " u:" + u);
    }
}