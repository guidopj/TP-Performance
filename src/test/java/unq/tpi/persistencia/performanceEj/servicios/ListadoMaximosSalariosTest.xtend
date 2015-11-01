package unq.tpi.persistencia.performanceEj.servicios;

import org.junit.Test

class ListadoMaximosSalariosTest extends BaseListadoTest {
	
	//7599
	//3173
	@Test
	def void testListadoMaximosSalarios() {
		val fileName = "./target/MaximosSalarios.csv"
		new ListadoMaximosSalarios(fileName).generarListado();
		assertListadoLength(12, fileName);
	}

}
