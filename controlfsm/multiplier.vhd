library ieee;
use ieee.std_logic_1164.all;

entity multiplier is
	port(
		a,b:in std_logic_vector(2 downto 0);
		s :buffer std_logic_vector(5 downto 0)
	);
end multiplier;

architecture alu_multiplier of multiplier is
signal z2,z1,z0:std_logic_vector(5 downto 0);
signal f:std_logic_vector(5 downto 0);
signal fc:std_logic_vector(5 downto 0);
component madder is
	port(
		u,v:in std_logic_vector(5 downto 0);
		w:buffer std_logic_vector(5 downto 0)
	);
end component;

begin
	z0(5 downto 3)<="000";
	z1(5 downto 4)<="00";z1(0)<='0';
	z2(5)<='0';z2(1 downto 0)<="00";
	
	z0(0)<=a(0) and b(0);
	z0(1)<=a(1) and b(0);
	z0(2)<=a(2) and b(0);
	
	z1(1)<=a(0) and b(1);
	z1(2)<=a(1) and b(1);
	z1(3)<=a(2) and b(1);
	
	z2(2)<=a(0) and b(2);
	z2(3)<=a(1) and b(2);
	z2(4)<=a(2) and b(2);
	
	madder1:madder port map(z0,z1,f);
	madder2:madder port map(z2,f,s);

end alu_multiplier;	