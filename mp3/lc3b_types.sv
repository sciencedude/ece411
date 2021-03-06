package lc3b_types;

typedef logic [15:0] lc3b_word;
typedef logic  [7:0] lc3b_byte;

typedef logic  [8:0] lc3b_offset9;
typedef logic  [5:0] lc3b_offset6;

typedef logic  [2:0] lc3b_reg;
typedef logic  [2:0] lc3b_nzp;
typedef logic  [1:0] lc3b_mem_wmask;

typedef logic	[2:0]	lc3b_c_index;

typedef enum bit [3:0] {
    op_add  = 4'b0001,
    op_and  = 4'b0101,
    op_br   = 4'b0000,
    op_jmp  = 4'b1100,   /* also RET */
    op_jsr  = 4'b0100,   /* also JSRR */
    op_ldb  = 4'b0010,
    op_ldi  = 4'b1010,
    op_ldr  = 4'b0110,
    op_lea  = 4'b1110,
    op_not  = 4'b1001,
    op_rti  = 4'b1000,
    op_shf  = 4'b1101,
    op_stb  = 4'b0011,
    op_sti  = 4'b1011,
    op_str  = 4'b0111,
    op_trap = 4'b1111
} lc3b_opcode;

typedef enum bit [3:0] {
    alu_add,
    alu_and,
    alu_not,
    alu_pass,
    alu_sll,
    alu_srl,
    alu_sra
} lc3b_aluop;


typedef struct packed
{
	logic mem_read_d;
	logic mem_write;
	logic srcamux_sel;
	logic [2:0]srcbmux_sel;
	lc3b_aluop aluop;
	logic [1:0] marmux_sel;
	logic [2:0] mdr_mux_sel;
	logic [1:0] cc_mux_sel;
	logic load_regfile;
	logic load_cc;
	logic isI;
	logic mem_intr;
	logic [1:0] pcmux_sel; 
	logic destmux_sel;
}CONTROL;

/* IF_ID register values */
typedef struct packed
{
	lc3b_word intr;
	lc3b_word pc_out;
	logic brpredict;
}IF_ID;

/* ID_EX register values */
typedef struct packed
{
	CONTROL control_signals;		//subject to change I am just putting width as a place holder
	lc3b_word pc_out;
	lc3b_word srca_out;
	lc3b_word srcb_out;
	lc3b_word intr;
	logic [3:0] destreg;
	logic [3:0] sr1reg;
	logic [3:0] sr2reg;
	logic brpredict;
}ID_EX;

typedef struct packed
{
	//lc3b_word address;
	CONTROL control_signals;
	lc3b_word pc_out;
	//lc3b_nzp cc;
	lc3b_word alu_out;
	lc3b_word srcb_out;
	lc3b_word intr;
	logic [3:0] destreg;
	logic brpredict;
}EX_MEM;

typedef struct packed
{
	//lc3b_word address;
	CONTROL control_signals;
	lc3b_word mem_data;
	lc3b_word pc_out;
	lc3b_word alu_out;
	lc3b_word intr;
	logic [3:0] destreg;
	logic brpredict;
}MEM_WB;
	

endpackage : lc3b_types
