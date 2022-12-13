package com.deloitte.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.deloitte.Item;
import com.deloitte.util.HibernateHelper;

/**
 *
 * @author Mini Project - Group 6
 */
public class ItemDao {

	/*
	 * Adding New Item
	 */
	public int addItem(Item item) {
		SessionFactory sf = HibernateHelper.getInstance();
		if (sf != null) {

			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			s.save(item);
			tx.commit();
			s.close();
			return 1;
		}
		return 0;
	}

	/*
	 * This method fetches each and every values in our table
	 */
	public List<Item> fetchItem() {
		SessionFactory sf = HibernateHelper.getInstance();
		Session s = sf.openSession();
		Query<Item> q = s.createQuery("from Item", Item.class);
		List<Item> i = q.getResultList();
		s.close();
		return i;

	}

	/*
	 * this method is for editing the item price and quantity using itemID
	 */
	public int editItem(String id, Float qty, Float price) {
		SessionFactory sf = HibernateHelper.getInstance();
		Session s = sf.openSession();

		Transaction tx = s.beginTransaction();

		String s1 = "update Item i set i.qty =: q where i.invtCode =: code";
		String s2 = "update Item i set i.unitPrice =: p where i.invtCode =: code";

		Query qu = s.createQuery(s1);
		Query qu2 = s.createQuery(s2);
		qu.setParameter("q", qty);
		qu2.setParameter("p", price);
		qu.setParameter("code", id);
		qu2.setParameter("code", id);

		qu.executeUpdate();
		int status = qu2.executeUpdate();

		tx.commit();
		s.close();

		return status;
	}

}
