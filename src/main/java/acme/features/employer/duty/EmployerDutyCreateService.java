
package acme.features.employer.duty;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import acme.entities.descriptors.Descriptor;
import acme.entities.duties.Duty;
import acme.entities.roles.Employer;
import acme.framework.components.Errors;
import acme.framework.components.Model;
import acme.framework.components.Request;
import acme.framework.services.AbstractCreateService;

@Service
public class EmployerDutyCreateService implements AbstractCreateService<Employer, Duty> {

	// Internal state ---------------------------

	@Autowired
	EmployerDutyRepository repository;


	@Override
	public boolean authorise(final Request<Duty> request) {
		assert request != null;

		return true;
	}

	@Override
	public void bind(final Request<Duty> request, final Duty entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		request.bind(entity, errors, "descriptor");
	}

	@Override
	public void unbind(final Request<Duty> request, final Duty entity, final Model model) {
		assert request != null;
		assert entity != null;
		assert model != null;

		request.unbind(entity, model, "title", "description", "percentage");
		Collection<Descriptor> descriptors = this.repository.findAllDescriptors();
		model.setAttribute("descriptors", descriptors);
	}

	@Override
	public Duty instantiate(final Request<Duty> request) {
		assert request != null;
		Duty result;

		result = new Duty();

		return result;
	}

	@Override
	public void validate(final Request<Duty> request, final Duty entity, final Errors errors) {
		assert request != null;
		assert entity != null;
		assert errors != null;

		Collection<Descriptor> descriptors = this.repository.findAllDescriptors();
		request.getModel().setAttribute("descriptors", descriptors);

		String stringId = (String) request.getModel().getAttribute("idDescriptor");
		if (stringId == "null") {
			errors.state(request, stringId == "null", "idDescriptor", "employer.job.error.status.noDescriptor");
		}

		if (!errors.hasErrors("idDescriptor") && !errors.hasErrors("percentage")) {
			int id = Integer.parseInt(stringId);
			Descriptor descriptor = this.repository.findDescriptorById(id);
			double sum = 0;
			for (Duty d : descriptor.getDuties()) {
				sum = sum + d.getPercentage();
			}
			sum = sum + request.getModel().getDouble("percentage");
			errors.state(request, sum <= 100.00, "percentage", "employer.duty.error.percentage100");
		}
	}

	@Override
	public void create(final Request<Duty> request, final Duty entity) {
		assert request != null;
		assert entity != null;

		String stringId = (String) request.getModel().getAttribute("idDescriptor");
		int id = Integer.parseInt(stringId);
		Descriptor descriptor = this.repository.findDescriptorById(id);
		entity.setDescriptor(descriptor);
		this.repository.save(entity);
	}

}
