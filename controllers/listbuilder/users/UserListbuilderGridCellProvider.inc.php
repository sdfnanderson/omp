<?php

/**
 * @file classes/controllers/listbuilder/UserListbuilderGridCellProvider.inc.php
 *
 * Copyright (c) 2000-2011 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class UserListbuilderGridCellProvider
 * @ingroup controllers_grid
 *
 * @brief Base class for a cell provider that can retrieve labels from arrays
 */

import('lib.pkp.classes.controllers.grid.GridCellProvider');

class UserListbuilderGridCellProvider extends GridCellProvider {
	/**
	 * Constructor
	 */
	function UserListbuilderGridCellProvider() {
		parent::GridCellProvider();
	}

	//
	// Template methods from GridCellProvider
	//
	/**
	 * This implementation assumes a simple data element array that
	 * has column ids as keys.
	 * @see GridCellProvider::getTemplateVarsFromRowColumn()
	 * @param $row GridRow
	 * @param $column GridColumn
	 * @return array
	 */
	function getTemplateVarsFromRowColumn(&$row, $column) {
		$user =& $row->getData();
		$columnId = $column->getId();
		assert(is_a($user, 'User') && !empty($columnId));

		return array('labelKey' => $user->getId(), 'label' => $user->getFullName());
	}
}

?>