
package acme.features.authenticated.duty;

import java.util.Collection;

import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import acme.entities.duties.Duty;
import acme.framework.repositories.AbstractRepository;

@Repository
public interface AuthenticatedDutyRepository extends AbstractRepository {

	@Query("select d from Duty d where d.id =?1")
	Duty findOnebyId(int id);

	@Query("select d.duties from Descriptor d where d.id = ?1")
	Collection<Duty> findManyByDescriptorId(int id);
}
