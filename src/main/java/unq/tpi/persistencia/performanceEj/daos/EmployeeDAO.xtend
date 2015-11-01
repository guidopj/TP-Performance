package unq.tpi.persistencia.performanceEj.daos

import java.util.List
import unq.tpi.persistencia.performanceEj.model.Employee
import unq.tpi.persistencia.util.SessionManager

class EmployeeDAO {

	def getByName(String name, String lastName) {
		val session = SessionManager.getSession()
		session.createQuery("from Employee where firstName = :name and lastName = :lastName")
				.setParameter("name", name)
				.setParameter("lastName", lastName)
				.uniqueResult() as Employee
	}

	def getAll() {
		val session = SessionManager.getSession()
		session.createCriteria(Employee).list() as List<Employee>
	}

	def getByCode(int id) {
		val session = SessionManager.getSession()
		session.load(Employee, id) as Employee
	}
	
	def getXEmpleadosOrdSalarios(int i) {
		val session = SessionManager.getSession()
		val q = session.createQuery("select salary.employee from Salary salary order by salary.amount DESC")
		//val q = session.createQuery("select salary.employee from Salary salary order by salary.amount")
		q.maxResults = i 
		q.list as List<Employee>
	}

}
