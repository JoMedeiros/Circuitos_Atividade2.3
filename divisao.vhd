LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY divisao IS
	PORT	(	clk: 			IN STD_LOGIC;
				Numero: 		IN STD_LOGIC_VECTOR(15 DOWNTO 0);
				LER_A: 		IN STD_LOGIC;
				LER_B:		IN STD_LOGIC;
				INI_DIV:		IN STD_LOGIC;
				TERMINO:	 	OUT STD_LOGIC;
				test:			OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
				Quociente:	OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
			);
END;

ARCHITECTURE arch OF divisao IS

	COMPONENT PC
		PORT	(	clk: 			IN STD_LOGIC;
					LER_A: 		IN STD_LOGIC;
					LER_B:		IN STD_LOGIC;
					INI_DIV:		IN STD_LOGIC;
					FIM_DIV:		IN STD_LOGIC;
					load_A:		OUT STD_LOGIC;
					load_B:		OUT STD_LOGIC;
					clear:		OUT STD_LOGIC;
					operar:		OUT STD_LOGIC
				);
	END COMPONENT;

	COMPONENT PO
		PORT	(	clk: 			IN STD_LOGIC;
					Numero: 		IN STD_LOGIC_VECTOR(15 DOWNTO 0);
					load_A:		IN STD_LOGIC;
					load_B:		IN STD_LOGIC;
					clear:		IN STD_LOGIC;
					operar:		IN STD_LOGIC;
					FIM_DIV:		OUT STD_LOGIC;
					Quociente:	OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
					test:			OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
				);
	END COMPONENT;

SIGNAL FIM_DIV: STD_LOGIC;
SIGNAL load_A: STD_LOGIC;
SIGNAL load_B: STD_LOGIC;
SIGNAL clear: STD_LOGIC;
SIGNAL operar: STD_LOGIC;

BEGIN

	i0 : PC PORT MAP( clk, LER_A, LER_B, INI_DIV, FIM_DIV, load_A, load_B, clear, operar );
	i1 : PO PORT MAP( clk, Numero, load_A,load_B, clear, operar, FIM_DIV, Quociente, test );
	TERMINO <= FIM_DIV;
	
END arch;