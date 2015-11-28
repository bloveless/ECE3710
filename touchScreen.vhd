----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:53:18 11/27/2015 
-- Design Name: 
-- Module Name:    touchScreen - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity touchScreen is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           TP_INVAL : in  STD_LOGIC;
           TP_PENIRQ : in  STD_LOGIC;
           TP_BUSY : in  STD_LOGIC;
           TP_DOUT : in  STD_LOGIC;
           TP_CS : out  STD_LOGIC;
           TP_DCLK : out  STD_LOGIC;
           TP_DIN : out  STD_LOGIC;
           X_POS : out  STD_LOGIC;
           Y_POS : out  STD_LOGIC);
end touchScreen;

architecture Behavioral of touchScreen is

begin


end Behavioral;

