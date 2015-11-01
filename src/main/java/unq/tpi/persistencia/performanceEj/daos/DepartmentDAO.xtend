package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Department
import unq.tpi.persistencia.util.SessionManager

class DepartmentDAO {

	def getByName(String name) {
		val session = SessionManager.getSession()
		session.createQuery("from Department where name = :name")
				.setParameter("name", name).uniqueResult() as Department
	}

	def getByCode(String num) {
		val session = SessionManager.getSession()
		session.get(Department, num) as Department
	}
	
	def obtenerPorCodigoYSusEmpleados(String num){
		val session = SessionManager.getSession()
		val q =session.createQuery
			("from Department departament
			  join fetch departament.employees employees 
              join fetch employees.salaries join fetch 
              employees.titles where departament.code = :num ")
		q.setParameter("num", num);
		q.uniqueResult as Department
		
	} 

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Department).list() as List<Department>
	}

}
