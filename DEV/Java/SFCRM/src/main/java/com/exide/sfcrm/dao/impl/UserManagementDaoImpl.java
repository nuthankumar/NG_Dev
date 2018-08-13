/**
 * 
 */
package com.exide.sfcrm.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.exide.sfcrm.dao.UserManagementDao;
import com.exide.sfcrm.model.User;
import com.exide.sfcrm.model.UserGroup;
import com.exide.sfcrm.repository.UserGroupRepository;

/**
 * @author saurabhp
 *
 */
@Repository
@Transactional
public class UserManagementDaoImpl implements UserManagementDao {

	/**
	 * 
	 */
	private static final Logger LOGGER = LoggerFactory
			.getLogger(UserManagementDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private UserGroupRepository userGroupRepository;

	/*public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}*/

	@Override
	public User createOrUpdateUser(User user) throws Exception {
		// TODO Auto-generated method stub

		LOGGER.debug("Inside create or update user dao method");

		Session session = null;
		try {
			session = this.sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			
			for(UserGroup userGroup : user.getUserGroup()){
				if(null == userGroup.getId()){
					UserGroup userGroupInfo = userGroupRepository.getUserGroupBasedOnRole(userGroup.getName());
				    userGroup.setId(userGroupInfo.getId());
				}
			}
			session.saveOrUpdate(user);
			transaction.commit();
			session.flush();
			LOGGER.debug("User Id during creation or update : " + user.getId());
		} catch(HibernateException e){
			if (null != session && session.getTransaction() != null) {
				session.getTransaction().rollback();
			}
			LOGGER.error("Unable to persist data into user table " + e);
			throw e;
		}finally {
			if (null != session) {
				session.close();
			}
		}

		return user;

	}

}
