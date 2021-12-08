package _06_overloading;

import java.awt.Color;

import javax.swing.JPanel;

public class LeagueOptionPaneRunner {
	public static void main(String[] args) {
	//	LeagueOptionPane.showMessageDialog("The league is the best");
	//	LeagueOptionPane.showMessageDialog("The league is the best", "Message");
	//	LeagueOptionPane.showMessageDialog("The league is the best", "Message", "leagueDark.png");
	//	LeagueOptionPane.showMessageDialog("The league is the best", "Message", "league.png", Color.cyan);
		JPanel panel = LeagueOptionPane.showMessageDialog("The league is the best", "Message", "league.png", Color.MAGENTA);
	}
}
